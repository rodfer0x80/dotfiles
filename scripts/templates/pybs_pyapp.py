import subprocess
import sys
import os

class PyBS:
    NAME = "hackernewscli"
    REQUIREMENTS = [
        "requests"
    ]
    RUN = "hackernewscli_run"

    def __init__(self) -> None:
        self.env_path = os.path.expanduser("~/.cache/{}".format(self.NAME))
        self.env_bin = os.path.join(self.env_path, 'bin', 'python')

        self.activate_script = os.path.join(self.env_path, 'bin', 'activate')
        self.source_cmd = f"source {self.activate_script}"

    def __call__(self):
        self.run()
    
    def freshRun(self):
        self.clean()
        self.run()

    def run(self):
        self.setup()
        if self.RUN in globals() and callable(globals()[self.RUN]):
            globals()[self.RUN]()
            return 0
        else:
            return 1
    
    def clean(self):
        if os.path.exists(self.env_path):
            subprocess.run(["rm", "-rf", self.env_path])

    def setup(self):
        self.setupEnv()
        
    def setupEnv(self):
        os.makedirs(self.env_path, exist_ok=True)
        if not os.path.exists(self.env_bin):
            if self.createVenv() != 0:
                sys.stderr.write(f"[setupEnv] Error creating venv {self.env_path}\n")
            else:
                sys.stdout.write(f"[setupEnv] Successfully created venv {self.env_path}\n")
            if self.pipUpgradePackage("pip") != 0 :
                sys.stderr.write("[setupEnv] Error updating pip\n")
            else:
                sys.stdout.write("[setupEnv] Successfully updated pip\n")
            if self.REQUIREMENTS:
                for requirement in self.REQUIREMENTS:
                    if self.pipInstallPackage(requirement) != 0:
                        sys.stderr.write(f"[setupEnv] Error installing pip package {requirement}\n")
                    else:
                        sys.stdout.write(f"[setupEnv] Successfully installed pip package {requirement}\n")
            self.pipFreeze()

    def createVenv(self):
        try:
            subprocess.run(["python3", "-m", "venv", self.env_path])
        except:
            return 1
        return 0

    def pipUpgradePackage(self, package: str):
        try:
            subprocess.run([os.path.join(self.env_path, 'bin', 'pip'), 'install', '--upgrade', package])
        except:
            return 1
        return 0
    
    def sourceVenv(self):
        try:
            subprocess.run(self.source_cmd, shell=True, executable="/bin/bash")
        except:
            return 1
        return 0
    
    def pipInstallPackage(self, package: str):
        try:
            subprocess.run([os.path.join(self.env_path, 'bin', 'pip'), 'install', package])
        except:
            return 1
        return 0
    
    def pipFreeze(self):
        try:
            subprocess.run(f"{self.source_cmd} && pip freeze", shell=True, executable="/bin/bash")
        except:
            return 1
        return 0

    def setupEnv(self):
        os.makedirs(self.env_path, exist_ok=True)
        if not os.path.exists(self.env_bin):
            if self.createVenv() != 0:
                sys.stderr.write(f"[setupEnv] Error creating venv {self.env_path}\n")
            else:
                sys.stdout.write(f"[setupEnv] Successfully created venv {self.env_path}\n")
            if self.pipUpgradePackage("pip") != 0 :
                sys.stderr.write("[setupEnv] Error updating pip\n")
            else:
                sys.stdout.write("[setupEnv] Successfully updated pip\n")
            if self.REQUIREMENTS:
                for requirement in self.REQUIREMENTS:
                    if self.pipInstallPackage(requirement) != 0:
                        sys.stderr.write(f"[setupEnv] Error installing pip package {requirement}\n")
                    else:
                        sys.stdout.write(f"[setupEnv] Successfully installed pip package {requirement}\n")
            self.pipFreeze()

    def createVenv(self):
        try:
            subprocess.run(["python3", "-m", "venv", self.env_path])
        except:
            return 1
        return 0

    def pipUpgradePackage(self, package: str):
        try:
            subprocess.run([os.path.join(self.env_path, 'bin', 'pip'), 'install', '--upgrade', package])
        except:
            return 1
        return 0
    
    def sourceVenv(self):
        try:
            subprocess.run(self.source_cmd, shell=True, executable="/bin/bash")
        except:
            return 1
        return 0
    
    def pipInstallPackage(self, package: str):
        try:
            subprocess.run([os.path.join(self.env_path, 'bin', 'pip'), 'install', package])
        except:
            return 1
        return 0
    
    def pipFreeze(self):
        try:
            subprocess.run(f"{self.source_cmd} && pip freeze", shell=True, executable="/bin/bash")
        except:
            return 1
        return 0
    
if __name__ == '__main__':
    sys.exit(PyBS()())