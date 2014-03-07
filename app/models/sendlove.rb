class Sendlove < ActiveRecord::Base
	belongs_to :user

	# Mandrill API email message 
	def send_email(sender_first_name, sender_last_name, sender_id)
		require 'mandrill'

		full_name = sender_last_name ? sender_first_name + " " + sender_last_name : sender_first_name

		begin
	    mandrill = Mandrill::API.new Rails.application.config.mandrill_api_key
	    template_name = "sendlove"
	    template_content = []
	   	subject = "#{self.name}, #{sender_first_name} is going to make your week with these kind words..."
	    message = {"headers"=>{"Reply-To"=>"sendlove@mindbliss.me"},
	     "global_merge_vars"=>[
	     	{"name" => "name","content"=> self.name}, 
	     	{"name" => "body", "content"=> self.body}, 
	     	{"name"=> "firstname", "content"=> sender_first_name}, 
	     	{"name"=> "lastname", "content"=> sender_last_name}, 
	     	{"name"=> "sendword", "content"=> "Love"}, 
	     	{"name"=> "email", "content"=> self.email}, 
	     	{"name"=> "senderid", "content"=> sender_id}
	     ],
	     "track_clicks"=>nil,
	     "from_name"=>full_name,
	     "tracking_domain"=>nil,
	     "text"=>self.body,
	     # "subaccount"=>"customer-123",
	     "return_path_domain"=>nil,
	     "metadata"=>{"website"=>"mindbliss.me"},
	     "url_strip_qs"=>nil,
	     # "merge_vars"=>
	     #    [{"vars"=>[{"content"=>"merge2 content", "name"=>"merge2"}],
	     #        "rcpt"=>"recipient.email@example.com"}],
	     "view_content_link"=>nil,
	     "auto_html"=>nil,
	     "to"=>
	        [{"type"=>"to",
	            "name"=>self.name,
	            "email"=>self.email}],
	     # "google_analytics_campaign"=>"message.from_email@example.com",
	     "signing_domain"=>nil,
	     "inline_css"=>nil,
	     "track_opens"=>nil,
	     "important"=>false,
	     "subject"=>subject,
	     # "google_analytics_domains"=>["example.com"],
	     "tags"=>["password-resets"],
	     "from_email"=>"sendlove@mindbliss.me",
	     # "html"=>"<p>Example HTML content</p>",
	     # "recipient_metadata"=>
	     #    [{"values"=>{"user_id"=>123456}, "rcpt"=>"recipient.email@example.com"}],
	     "auto_text"=>nil,
	     "merge"=>true}
	    async = false
	    ip_pool = "Main Pool"
	    # send_at = "example send_at"
	    result = mandrill.messages.send_template template_name, template_content, message, async, ip_pool
	        # [{"status"=>"sent",
	        #     "email"=>"recipient.email@example.com",
	        #     "_id"=>"abc123abc123abc123abc123abc123",
	        #     "reject_reason"=>"hard-bounce"}]
    
		rescue Mandrill::Error => e
		    # Mandrill errors are thrown as exceptions
		    puts "A mandrill error occurred: #{e.class} - #{e.message}"
		    # A mandrill error occurred: Mandrill::UnknownSubaccountError - No subaccount exists with the id 'customer-123'    
		    raise
		end
	end
end
