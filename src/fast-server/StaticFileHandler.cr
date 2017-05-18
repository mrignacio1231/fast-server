class StaticFileHandler < HTTP::StaticFileHandler
  def call(context)
    if context.request.path.ends_with?("/")
      index_path = "/index.html"
      index_realpath = ENV["PUBLIC_DIR"] + index_path
      if File.exists?(index_realpath)
        context.request.path = index_path
      end
    end
    super
  end
end
