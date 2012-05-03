# GET home page.
exports.index = (req, res) ->
  res.render 'index', title: 'Express'
# Skeleton
exports.skeleton = (req, res) ->
  res.render 'skeleton', title: 'Skeleton'
