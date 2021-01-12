# windows
```sh
cd C:\Users\vj\AppData\Roaming
git clone https://github.com/vjatla/.emacs.d
# With elivated permissions from command prompt(does not work in power shell).
mklink /J C:\Users\vj\.emacs.d C:\Users\vj\AppData\Roaming
```