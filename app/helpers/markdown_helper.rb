require 'redcarpet'

module MarkdownHelper

  def markdown(text)
    renderer.render(text).html_safe
  end

  private

    def renderer
      @@renderer ||= Redcarpet::Markdown.new(FomanticMarkdownRenderer, {
        hard_wrap: true,
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
      })
    end

end


class FomanticMarkdownRenderer < Redcarpet::Render::HTML
  HEADER_ICONS = {
    important: 'rocket',
    opportunity: 'award',
    need: 'mug hot',
    list: 'tasks',
    article: 'newspaper',
    guidance: 'camera',
    email: 'mail',
    collaborations: 'handshake',
    potential: 'tasks'
  }

  def list(contents, list_type)
    tag = list_type == 'orderer' ? 'ol' : 'ul'
    %(<#{tag} class="ui #{list_type} list">#{contents}</#{tag}>)
  end

  def list_item(text, list_type)
    %(<li class="item">#{text}</li>)
  end

  def header(text, header_level)
    downcased_text = text.downcase
    icon = HEADER_ICONS.find { |k, v| downcased_text.include?(k.to_s) }&.last
    tag = "h#{header_level + 1}"
    %(<#{tag} class="ui header">
      #{"<i class=\"#{icon} icon\"></i>" if icon}
      #{text}
    </#{tag}>)
  end

  def block_quote(text)
    %(<div class="ui small message">
      <em>#{text}</em>
    </div>)
  end
end
