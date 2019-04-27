FROM python:3.7

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

# Add requirements file first, to cache dependencies
COPY requirements.txt requirements.txt

# Install dependencies
RUN pip install -r requirements.txt

# Add source code
COPY src src

ENV DJANGO_SETTINGS_MODULE="bellerophon.settings.dev" \
    PYTHONPATH=/app/src

ENTRYPOINT ["python", "src/manage.py"]
CMD ["runserver", "0.0.0.0:80"]
