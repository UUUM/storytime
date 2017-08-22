module Storytime
  class Search::Post < Search::Base
    ATTRIBUTES = %i(
      q
    )
    attr_accessor(*ATTRIBUTES)

    def matches(posts)
      t = Storytime::Post.arel_table
      posts = posts.where(contains(t[:title], q)) if q.present?
      posts
    end
  end
end