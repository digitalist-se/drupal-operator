while true
do
    kubectl get pods -l job-name=test-cluster-site-de-final-db-backup -o yaml | tee -a job_log.yml
    sleep 1
done
