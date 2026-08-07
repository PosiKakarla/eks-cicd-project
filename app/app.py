import sys
import time
from flask import Flask, jsonify

app = Flask(__name__)

start_time = time.time()
state = {"healthy": True}


@app.route("/")
def home():
    return jsonify({
        "message": "Hello from the EKS CI/CD portfolio app",
        "uptime_seconds": round(time.time() - start_time, 1)
    })


@app.route("/healthz")
def healthz():
    # Used by the LIVENESS probe.
    # If this returns non-200, Kubernetes restarts the container.
    if state["healthy"]:
        return jsonify({"status": "healthy"}), 200
    return jsonify({"status": "unhealthy"}), 500


@app.route("/readyz")
def readyz():
    # Used by the READINESS probe.
    # If this returns non-200, Kubernetes stops sending traffic here,
    # but does NOT restart the container.
    if state["healthy"]:
        return jsonify({"status": "ready"}), 200
    return jsonify({"status": "not ready"}), 503


@app.route("/toggle-unhealthy", methods=["POST"])
def toggle_unhealthy():
    # Flips the health flag so /healthz and /readyz start failing,
    # without killing the process. Demonstrates the failed-probe path.
    state["healthy"] = not state["healthy"]
    return jsonify({"healthy": state["healthy"]})


@app.route("/crash")
def crash():
    # Kills the process outright, demonstrating a different failure mode:
    # container death (not just a failed probe), still handled by Kubernetes restart.
    sys.exit(1)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)