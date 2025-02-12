FROM python:3.9.2-alpine

RUN apk update
RUN apk add g++ clang bash make && rm -rf /var/cache/apk/*

# Create a user that has the same GID and UID as you
ARG GROUP_ID
ARG USER_ID
RUN addgroup -g $GROUP_ID dis-cover
RUN adduser -D -u $USER_ID -G dis-cover dis-cover

# Work directory
WORKDIR /home/dis-cover/dis-cover

COPY setup.py .
RUN pip install . black

USER dis-cover
