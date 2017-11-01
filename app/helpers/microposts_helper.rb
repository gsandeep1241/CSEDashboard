module MicropostsHelper
    def admin_not_tagged?(post)
        post.tag.nil? || post.tag.eql?("")
    end
end
