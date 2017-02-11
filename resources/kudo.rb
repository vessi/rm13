# Kudo resource => /kudo/:id
class KudoResource < Webmachine::Resource
  def trace?
    true
  end

  def allowed_methods
    %w(GET)
  end

  def content_types_provided
    [
      ['text/html', :html],
      ['application/json', :json]
    ]
  end

  def resource_exists?
    kudo
  end

  def html
    <<-HTML
    <html>
      <body>
        Kudos to #{kudo.name}!
      </body>
    </html>
    HTML
  end

  def json
    [kudo.to_json]
  end

  private

  def kudo
    @kudo ||= Kudo.find(id)
  end

  def id
    request.path_info[:id]
  end
end
