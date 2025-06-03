module Jekyll
    class MermaidConverter < Converter
      safe true
      priority :high
  
      def matches(ext)
        ext =~ /^\.md$/i
      end
  
      def output_ext(ext)
        ".html"
      end
  
      # replace ```(任意空格)mermaid with <pre class="mermaid">
      def convert(content)
        reg = /```[\t ]*mermaid[\t ]*\n(.*?)\n```/m
        content.gsub(reg) do |_|
          # Extract mermaid content between the markers
          mermaid_content = Regexp.last_match(1)
          # Return formatted HTML with mermaid content
          "<pre class='mermaid'>\n#{mermaid_content}\n</pre>"
        end
      end
    end
  end