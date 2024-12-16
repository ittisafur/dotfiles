# Symfony Functions
sf() {
  if [ -f bin/console ]; then
    bin/console "$@"
  else
    php bin/console "$@"
  fi
}

# Clear Cache
sfcc() {
  sf cache:clear
}

# Makes new Entity
sfme(){
  sf make:entity "$@"
}

# Creates database with Doctorine
sfcd(){
  sf doctrine:database:create
}

# Migrate database with Doctorine
sfmm(){
  sf doctrine:migrations:migrate
}

# Get all routes
sfr(){
  sf debug:router
}

# Server start
sfs(){
  sf serve -d
}

# Symfony Functions Ends
