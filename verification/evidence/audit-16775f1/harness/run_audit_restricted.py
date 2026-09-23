#!/usr/bin/env python3
"""Run an explicitly selected official Lean tool in a credential-free macOS sandbox with official audit Python/Git runtime."""
from pathlib import Path
import argparse, hashlib, json, os, resource, signal, subprocess, time
p=argparse.ArgumentParser()
p.add_argument('--source',required=True,type=Path)
p.add_argument('--run',required=True,type=Path)
p.add_argument('--label',required=True)
p.add_argument('--cwd',type=Path)
p.add_argument('--audit-root',type=Path,default=Path('/Users/jiahongli/workspace/justinsun/official-awards/skills/lean-verify'))
p.add_argument('--timeout',type=int,default=600)
p.add_argument('command',nargs=argparse.REMAINDER)
a=p.parse_args()
base=Path(__file__).resolve().parent
toolchain=base/'lean-4.32.0-darwin_aarch64'
source=a.source.resolve(strict=True)
run=a.run.resolve()
run.mkdir(parents=True,exist_ok=True)
assert source.is_dir() and run.is_dir()
cwd=a.cwd.resolve(strict=True) if a.cwd else run
assert cwd.is_relative_to(run) or cwd.is_relative_to(source)
audit_root=a.audit_root.resolve(strict=True)
assert 1<=a.timeout<=7200
assert a.label and all(c.isalnum() or c in '-_' for c in a.label)
cmd=a.command[1:] if a.command and a.command[0]=='--' else a.command
assert cmd and cmd[0] in {'lean','leanchecker','lake','python3','git'}
exe=(Path('/Library/Developer/CommandLineTools/usr/bin')/cmd[0] if cmd[0] in {'python3','git'} else toolchain/'bin'/cmd[0])
assert exe.is_file()
env={'PATH':f'{toolchain}/bin:/Library/Developer/CommandLineTools/usr/bin:/usr/bin:/bin','HOME':'/nonexistent','TMPDIR':str(run),'LANG':'C','GIT_CONFIG_NOSYSTEM':'1','GIT_CONFIG_GLOBAL':'/dev/null','PYTHONDONTWRITEBYTECODE':'1'}
profile=base/'lean-audit-sandbox.sb'
prefix=['/usr/bin/sandbox-exec','-D',f'TOOLCHAIN={toolchain}','-D',f'SOURCE={source}','-D',f'RUN={run}','-D',f'AUDIT_ROOT={audit_root}','-f',str(profile)]
full=prefix+[str(exe)]+cmd[1:]
def limits():
 os.setsid()
 resource.setrlimit(resource.RLIMIT_CPU,(a.timeout,a.timeout))
 resource.setrlimit(resource.RLIMIT_FSIZE,(1024**3,1024**3))
 resource.setrlimit(resource.RLIMIT_NOFILE,(256,256))
started=time.time()
timed_out=False
outpath=run/f'{a.label}.log'
with outpath.open('w') as out:
 process=subprocess.Popen(full,cwd=cwd,env=env,stdout=out,stderr=subprocess.STDOUT,preexec_fn=limits)
 try: rc=process.wait(timeout=a.timeout)
 except subprocess.TimeoutExpired:
  timed_out=True
  os.killpg(process.pid,signal.SIGKILL)
  rc=process.wait()
result={'command':full,'cwd':str(cwd),'environment':env,'profile_sha256':hashlib.sha256(profile.read_bytes()).hexdigest(),'started_unix':started,'elapsed_seconds':time.time()-started,'returncode':rc,'timed_out':timed_out,'limits':{'wall_seconds':a.timeout,'cpu_seconds_per_process':a.timeout,'file_bytes':1024**3,'open_files':256,'memory_note':'Specify Lean -M separately; no OS-level RAM cap is claimed.'},'log':str(outpath)}
(run/f'{a.label}.json').write_text(json.dumps(result,indent=2)+'\n')
print(outpath.read_text(),end='')
print(json.dumps({'returncode':rc,'timed_out':timed_out,'elapsed_seconds':result['elapsed_seconds'],'evidence':str(run/f'{a.label}.json')}))
raise SystemExit(124 if timed_out else rc)
