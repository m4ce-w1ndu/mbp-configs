#!/usr/bin/env bash

PID_FILE="/tmp/ollama.pid"
LOG_FILE="/tmp/ollama.log"

case "$1" in
  start)
    if [ -f "$PID_FILE" ] && kill -0 $(cat "$PID_FILE") 2>/dev/null; then
      echo "Ollama is already running (PID: $(cat $PID_FILE))."
    else
      echo "Starting Ollama..."
      # We assume 'ollama' is in the PATH or passed via Nix wrapper
      nohup ollama serve > "$LOG_FILE" 2>&1 &
      echo $! > "$PID_FILE"
      echo "Ollama started (PID: $(cat $PID_FILE)). Logs at $LOG_FILE"
    fi
    ;;
  stop)
    if [ -f "$PID_FILE" ]; then
      PID=$(cat "$PID_FILE")
      if kill -0 "$PID" 2>/dev/null; then
        echo "Stopping Ollama (PID: $PID)..."
        kill "$PID"
        rm "$PID_FILE"
        echo "Ollama stopped."
      else
        echo "Ollama process $PID not found. Cleaning up pid file."
        rm "$PID_FILE"
      fi
    else
      echo "Ollama is not running (no PID file)."
    fi
    ;;
  status)
    if [ -f "$PID_FILE" ] && kill -0 $(cat "$PID_FILE") 2>/dev/null; then
      echo "Ollama is running (PID: $(cat $PID_FILE))."
    else
      echo "Ollama is NOT running."
    fi
    ;;
  *)
    echo "Usage: $0 {start|stop|status}"
    exit 1
    ;;
esac
