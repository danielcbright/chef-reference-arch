for d in ../attribute-data-bags/*/ ; do
  dirname="${d%/}"
  dirname="${dirname##*/}"
  knife data bag create ${dirname%/}
  for f in $d* ; do
    ver_on_server=`knife data bag show $dirname attributes -F json | jq -r '.version'`
    ver_on_disk=`jq -r '.version' $f`
    filename="${f%/}"
    filename="${filename##*/}"
    filename=$(echo "$filename" | cut -f 1 -d '.')
    mkdir -p ../attribute-data-bags-archive/$dirname
    echo "Version of [$dirname $f] on disk is :[$ver_on_disk], server: [$ver_on_server]"
    if [ "$ver_on_disk" -gt "$ver_on_server" ]; then
      while true; do
        read -p "Do you want to run [knife data bag from file $dirname $f]? (y/n): " yn
        case $yn in
          [Yy]* ) knife data bag show global attributes -F json > ../attribute-data-bags-archive/$dirname/$filename-$ver_on_server.json;
                  ln -f -s $filename-$ver_on_server.json ../attribute-data-bags-archive/$dirname/$filename-last.json;
                  knife data bag from file $dirname $f;
                  break;;
          [Nn]* ) break;;
          * ) echo "Please answer yes or no.";;
        esac
      done
    else
      echo "Skipping data bag upload for $f since it's version on disk is not greater than the version on the server...\n"
    fi
  done
done