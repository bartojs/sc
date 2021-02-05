case `sc` in
  *.svn) svn status -q . | tr '\\' '/' | awk '{print$2}' ;;
  *.git) git status -s . | awk '!/\?/{print$2}' ;;
esac
