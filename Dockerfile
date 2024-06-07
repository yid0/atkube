FROM python-3.8.10:slim as dev

ARG PORT=8080
ENV PORT=${PORT}

USER 1001

WORKDIR /app

RUN pip install fastapi uvicorn

COPY fast-api.py .


FROM base:slim as prod 

COPY --from=dev --chown=1001:1001 ./app/fast-api.py .

COPY --from=dev /app/fast-api.py /app/

CMD ["uvicorn", "fast-api:app", "--host", "0.0.0.0", "--port", $PORT ]