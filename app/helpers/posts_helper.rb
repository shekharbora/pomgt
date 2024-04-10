module PostsHelper

    def is_current_user_post?(post)
        post.user == current_user
    end
end
