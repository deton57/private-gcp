while true; do
ab -n 10 -c 10 https://{replace-with-your-cloud-run-url}:80/
done
