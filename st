if [[ "$1" == "-q" ]]
then
    case `sc || echo 'false'` in
      *.git) git status -s . | awk '!/\?/{print$2}' | xargs ls -1t ;;
      *.svn) svn status -q . | awk '{print$2}' | tr '\\' '/' | xargs ls -1t ;;
      *.pijul) pijul diff --short | awk '!/\?/{print$2}' | xargs ls -1t ;;
      false) echo not a repo
    esac
else
    case `sc || echo 'false'` in
      *.git) git status -s . | awk '!/\?/{print$2}' | xargs ls -t | xargs mt ;;
      *.svn) svn status -q . | awk '{print$2}' | tr '\\' '/' | xargs ls -t | xargs mt ;;
      *.pijul) pijul diff --short | awk '!/\?/{print$2}' | xargs ls -t | xargs mt ;;
      false) echo not a repo
    esac
fi
