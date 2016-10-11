module VLCTechHub
  module Job
    class Twitter
      include VLCTechHub::TwitterClient

      def self.new_job(attrs)
        new.tweet(attrs)
      end

      def tweet(attrs)
        super("Nueva #ofertaDeEmpleo: #{attrs['title']} por #{company(attrs)}  http://vlctechhub.org/job/board/#{attrs['publish_id']}")
      end

      private

      def company(attrs)
        [attrs['company']['twitter'], attrs['company']['name']]
          .find { |e| !e.to_s.empty? }
      end
    end
  end
end
