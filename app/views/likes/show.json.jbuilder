json.set! :like_id, @like.id
json.set! :response_likes, Like.where(response_id: @like.response_id).size
json.set! :response_likes_words, pluralize(Like.where(response_id: @like.response_id).size,"like")