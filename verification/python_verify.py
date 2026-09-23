#!/usr/bin/env python3
"""Independently check Li's 9-vertex construction using Python's standard library.

The JSON contains transcribed mathematical data, not trusted conclusions. This
checker uses subsets encoded as integer bitmasks and is independently written;
it does not import or run the paper's Appendix C program or any Lean submission.
Python enumeration is a reproducibility check, not a Lean kernel proof.

Usage: python3 verification/python_verify.py [path/to/construction.json]
"""

import hashlib
import json
from pathlib import Path
import platform
import sys


def require(condition, message):
    # Deliberately not an assert: python -O must not disable verification.
    if not condition:
        raise ValueError(message)


def submasks(mask):
    """Every subset of mask exactly once, including the empty subset."""
    current = mask
    while True:
        yield current
        if current == 0:
            return
        current = (current - 1) & mask


def monochromatic(edge_mask, blue_mask):
    intersection = edge_mask & blue_mask
    return intersection == 0 or intersection == edge_mask


def proper(edge_masks, blue_mask):
    return not any(monochromatic(edge, blue_mask) for edge in edge_masks)


def main(path):
    raw = path.read_bytes()
    data = json.loads(raw)
    vertices = data["vertices"]
    require(vertices == list(range(1, 10)), "Expected the nine source labels 1..9")
    positions = {vertex: index for index, vertex in enumerate(vertices)}
    universe = (1 << len(vertices)) - 1

    def mask(items):
        require(len(items) == len(set(items)), "Repeated element in a set")
        require(all(type(v) is int and v in positions for v in items),
                "Set contains an unknown/noninteger vertex")
        return sum(1 << positions[v] for v in items)

    edge_lists = data["edges"]
    require(len(edge_lists) == 22, "Expected 22 source edges")
    require(all(len(e) == 3 for e in edge_lists), "Not 3-uniform")
    edges = [mask(e) for e in edge_lists]
    require(len(set(edges)) == 22, "Duplicate edge")
    degrees = [sum(bool(e & (1 << i)) for e in edges)
               for i in range(len(vertices))]
    require(degrees == data["expected_degrees"], "Degree data mismatch")
    require(degrees == [10] + [7] * 8, "Incorrect source degree sequence")
    require(sum(degrees) == 3 * len(edges), "Incidence count mismatch")

    print("Independent verification of JSP-000690 (chromatic interpretation)")
    print("Source: " + data["source"]["url"])
    print("Data file: " + str(path))
    print("Data SHA256: " + hashlib.sha256(raw).hexdigest())
    print("Verifier SHA256: " + hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
    print("Python: " + platform.python_version())
    print("Vertices: 9; distinct 3-element edges: 22")
    print("Degrees in vertex order: " + str(degrees))
    print("Minimum degree: 7; incidence sum: 66")

    colorings = list(submasks(universe))
    require(len(colorings) == 512 and len(set(colorings)) == 512,
            "Binary-coloring enumeration is incomplete")
    mono_lists = [[index for index, edge in enumerate(edges)
                   if monochromatic(edge, blue)] for blue in colorings]
    require(all(mono_lists), "A proper 2-coloring exists")
    print("All 512 binary colorings checked; proper 2-colorings: 0")

    classes = data["three_coloring_classes"]
    require(len(classes) == 3, "Expected three color classes")
    class_masks = [mask(c) for c in classes]
    flattened = [v for group in classes for v in group]
    require(sorted(flattened) == vertices, "Three classes do not partition V")
    require(all(all((edge & group) != edge for group in class_masks)
                for edge in edges), "The proposed 3-coloring is improper")
    print("Source proper 3-coloring verified; chromatic number exactly 3")

    edge_certs = data["edge_deletion_certificates"]
    cert_edges = [mask(c["deleted_edge"]) for c in edge_certs]
    require(len(cert_edges) == 22 and set(cert_edges) == set(edges),
            "Edge certificates do not cover all edges exactly once")
    for cert, removed in zip(edge_certs, cert_edges):
        blue = mask(cert["blue_vertices"])
        mono = [e for e in edges if monochromatic(e, blue)]
        require(mono == [removed], "Edge certificate has wrong monochromatic edges")
        remaining = [e for e in edges if e != removed]
        count = sum(proper(remaining, coloring) for coloring in colorings)
        require(count > 0, "Edge deletion failed independent exhaustive check")
        print("H - " + str(cert["deleted_edge"]) + ": source certificate PASS; "
              + str(count) + " proper 2-colorings / 512")
    print("All 22 edge deletions verified (11,264 full binary-coloring checks)")

    vertex_certs = data["vertex_deletion_certificates"]
    deleted = [c["deleted_vertex"] for c in vertex_certs]
    require(len(deleted) == 9 and sorted(deleted) == vertices,
            "Vertex certificates do not cover all vertices exactly once")
    for cert in vertex_certs:
        removed = 1 << positions[cert["deleted_vertex"]]
        retained = universe ^ removed
        # Induced deletion discards each incident edge in its entirety.
        remaining = [e for e in edges if e & removed == 0]
        blue = mask(cert["blue_vertices"])
        require(blue & removed == 0, "Deleted vertex occurs in its certificate")
        require(proper(remaining, blue), "Invalid vertex-deletion certificate")
        count = sum(proper(remaining, coloring) for coloring in submasks(retained))
        require(count > 0, "Vertex deletion failed independent exhaustive check")
        print("H - vertex " + str(cert["deleted_vertex"])
              + ": source certificate PASS; " + str(len(remaining))
              + " retained edges; " + str(count) + " proper 2-colorings / 256")
    print("All 9 vertex deletions verified (2,304 full binary-coloring checks)")

    # An additional independent check covers all proper induced vertex subsets.
    # This does not claim enumeration of every arbitrary edge subset.
    checked_subsets = 0
    checked_colorings = 0
    for retained in submasks(universe):
        if retained == universe:
            continue
        remaining = [e for e in edges if e & retained == e]
        count = 0
        for blue in submasks(retained):
            checked_colorings += 1
            count += proper(remaining, blue)
        require(count > 0, "A proper induced subhypergraph is not 2-colorable")
        checked_subsets += 1
    require(checked_subsets == 511 and checked_colorings == 3**9 - 2**9,
            "Proper induced subhypergraph enumeration is incomplete")
    print("All 511 proper induced vertex subhypergraphs checked; "
          + str(checked_colorings) + " binary colorings enumerated")

    transversals = [t for t in submasks(universe) if all(t & e for e in edges)]
    tau = min(t.bit_count() for t in transversals)
    print("Independent transversal number (context only): " + str(tau))
    print("Every proper subhypergraph is 2-colorable by restriction of a verified")
    print("edge-deletion or vertex-deletion coloring; no edge-shrinking notion is used.")
    print("PASS: 3-uniform, minimum degree 7, chromatic number 3,")
    print("edge-critical and vertex-critical, with all 31 source certificates verified.")


if __name__ == "__main__":
    require(len(sys.argv) <= 2, "Usage: python_verify.py [construction.json]")
    source = (Path(sys.argv[1]) if len(sys.argv) == 2 else
              Path(__file__).with_name("construction.json"))
    try:
        main(source.resolve())
    except (ValueError, KeyError, TypeError, OSError) as error:
        print("FAIL: " + str(error), file=sys.stderr)
        sys.exit(1)
