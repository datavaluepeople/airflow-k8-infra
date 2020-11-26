#!/bin/sh

. ./azure/scripts/variables.sh

CMD="airflow create_user -r Admin -u $AIRFLOWWEBUSERNAME -e $AIRFLOWWEBUSEREMAIL -f $AIRFLOWWEBUSERFN -l $AIRFLOWWEBUSERLN -p $AIRFLOWWEBUSERPASS"
echo "Running command in airflow web container: \n $CMD"
kubectl exec \
  -it \
  --namespace $NAMESPACE \
  --container airflow-web \
  Deployment/$CLUSTERNAME-web \
  -- /bin/bash -c "$CMD"
