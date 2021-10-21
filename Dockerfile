FROM pytorch/pytorch:1.9.0-cuda11.1-cudnn8-runtime

RUN apt update &&\
    apt install -y git curl
RUN conda update -y conda

WORKDIR /workspace

COPY pyproject.toml ./
COPY poetry.lock ./
RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install