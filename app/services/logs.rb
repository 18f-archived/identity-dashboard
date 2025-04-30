# # frozen_string_literal: true

# class Logs
#   include LogEvents

#   attr_reader :user, :request, :session, :event_logger

#   # @param [User] user
#   # @param [ActionDispatch::Request,nil] request
#   # @param [Hash] session
#   # @param [EventLogger,nil] logger
#   def initialize(user:, request:, session:, logger: nil)
#     @user = user
#     @request = request
#     @session = session
#     @event_logger = logger || create_logger
#   end

#   def track_event(event, attributes = {})
#     event_hash = {
#       event_properties: attributes.except(:user_id).compact,
#       path: request&.path,
#     }.compact

#     event_hash.merge!(request_attributes) if request

#     event_logger.track(event, event_hash)
#   end

#   def request_attributes
#     attributes = {
#       user_ip: request.remote_ip,
#       hostname: request.host,
#     }

#     attributes.merge!(browser_attributes)
#   end

#   def browser
#     @browser ||= BrowserCache.parse(request.user_agent)
#   end

#   def browser_attributes
#     {
#       user_agent: request.user_agent,
#       browser_name: browser.name,
#       browser_version: browser.full_version,
#       browser_platform_name: browser.platform.name,
#       browser_platform_version: browser.platform.version,
#       browser_device_name: browser.device.name,
#       browser_mobile: browser.device.mobile?,
#       browser_bot: browser.bot?,
#     }
#   end

#   private

#   def create_logger
#     @event_logger || EventLogger.new(
#       request:,
#       user:,
#       session:,
#     )
#   end
# end
