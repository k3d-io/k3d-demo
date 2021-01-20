print('Hello Tilt!')

docker_build('sample-app', 'sample/', dockerfile='sample/Dockerfile')
k8s_yaml(
  helm(
    'sample/conf/charts/sample-app',
    set=['app.srcFrom=null']
  )
)
