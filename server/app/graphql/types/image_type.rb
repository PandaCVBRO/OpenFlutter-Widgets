module Types
  class ImageType < Types::BaseScalar
    def self.coerce_input(file, context)
      return nil if file.nil?

      ActionDispatch::Http::UploadedFile.new(
        filename: file.original_filename,
        type: file.content_type,
        head: file.headers,
        tempfile: file.tempfile
      )
    end

    def self.coerce_result(ruby_value, context)
      "#{ruby_value.url}?x-oss-process=style/poster" if ruby_value
    end
  end
end
