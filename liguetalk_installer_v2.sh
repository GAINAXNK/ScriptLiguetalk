#!/bin/bash
# Instalação do Wine
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y wine64 wine32

# Baixar o LigueTalk
wget https://www.microsip.org/download/private/LigueTalk-3.20.7.exe -O ~/Downloads/LigueTalk-3.20.7.exe

# Instalar o LigueTalk
wine ~/Downloads/LigueTalk-3.20.7.exe

# Procurar diretórios de instalação
LIGUETALK_PATH=$(find ~/.wine/ -name LigueTalk.exe)

# Criar atalho executável
echo '#!/bin/bash' > ~/abrir_liguetalk.sh
echo 'wine "$LIGUETALK_PATH"' >> ~/abrir_liguetalk.sh

# Tornar o script executável
chmod +x ~/abrir_liguetalk.sh

# Detectar o caminho correto da área de trabalho, considerando variações de ambientes desktop
DESKTOP_PATH=$(xdg-user-dir DESKTOP)

# Mover o script para a área de trabalho
mv ~/abrir_liguetalk.sh "$DESKTOP_PATH/abrir_liguetalk.sh"
