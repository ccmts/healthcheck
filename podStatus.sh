#!/bin/sh
/bin/kubectl get pods | {
while IFS= read -r line
do
case "$line"  in
*"Running"*)
;;
*"STATUS"*)
;;
*"ContainerCreating"*)
;;
*)
echo "Pods not in running status" > /dev/termination-log ;
exit 1;;
esac
done
}
