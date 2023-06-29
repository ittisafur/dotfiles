# Generate Credentials for Staging
gcali(){
  gcloud auth list
}

gcalo(){
  gcloud auth revoke --all
}

gcal(){
  gcloud auth login
}

gcalp(){
  gcloud auth print-access-token
}


