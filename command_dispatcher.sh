# Script base directory
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

# Modules as found in pom.xml
array=($(grep -oP '(?<=<module>).*?(?=</module)' $DIR/pom.xml))

# Repeat of the passed commands in every module directory
for i in "${array[@]}"; do
  cd "$DIR/$i"
  "$@"
done
