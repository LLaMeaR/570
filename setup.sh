# env
conda env list
mamba create --name cs570 python=3.12 -y
conda activate cs570

# tmux
tmux new -s cs570
tmux attach -t cs570

# install
conda activate cs570
pip install --upgrade --timeout 1000 -r requirements.txt

# update
task pip-install
task pip-upgrade

# check
pip check

# login
source .env
huggingface-cli login --token $HF_TOKEN

# reset
conda env list
conda activate base
conda remove --name cs570 --all -y

# add aihubshell to local
# download: https://www.aihub.or.kr/devsport/apishell/list.do
ls -hal /usr/local/bin
cp docs/aihubshell /usr/local/bin/aihubshell
chmod +x /usr/local/bin/aihubshell
source .env
aihubshell --help
