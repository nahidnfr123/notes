# install git
sudo apt update && sudo apt install git

# Personal account
ssh-keygen -t ed25519 -C "your_personal_email@example.com" -f ~/.ssh/id_ed25519_personal

# Work account
ssh-keygen -t ed25519 -C "your_work_email@example.com" -f ~/.ssh/id_ed25519_work


# set permission if it's incorrect
chmod 600 ~/.ssh/id_ed25519_personal
chmod 600 ~/.ssh/id_ed25519_work
chmod 700 ~/.ssh


# Add keys to ssh-agent
eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519_personal
ssh-add ~/.ssh/id_ed25519_work


# Check key
ssh-add -l


# create ~/.ssh/config

# Personal GitHub
Host github.com-personal
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_personal

# Work GitHub
Host github.com-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_work


# check connection
ssh -T git@github.com-personal
ssh -T git@github.com-work


# usage
git clone git@github.com-personal:username/repo.git

git clone git@github.com-work:work-username/repo.git
