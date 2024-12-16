# workshop docker
# o FROM busca uma imagem no docker hub, no caso uma de python ja configurada e versionada, 
# nao precisa instalar pyenv, nem python, pq ja vem
FROM python:3.12

# instale o poetry
RUN pip install poetry

# copia tudo que esta na pasta do dockerfile e joga para a pasta /src no container
COPY . /src

# mude para a pasta src para realizar os trabalhos
WORKDIR /src

# instale dependencias do projeto
RUN poetry install

# abra uma porta para permitir conexao para porta convencionada para streamlit
EXPOSE 8501

# escreva o que vc quer escrever no terminal
ENTRYPOINT ["poetry","run", "streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]