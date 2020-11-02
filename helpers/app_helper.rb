module AppHelper

  # Project path.
  @@root = nil

  ##
  # Expose app to components.
  #
  # @param app [App] The main Sinatra::Base instance.
  ##
  def self.set_app(app)
    @@app ||= app
  end

  ##
  # Expose session to components.
  #
  # @param session [Session] The server session.
  ##
  def self.set_session(session)
    @@session ||= session
  end

  ##
  # Load database from JSON file.
  #
  # @param root [String] Absolute path to the root of the project.
  # @return [Hash] The database.
  ##
  def self.load_db(root)
    @@db ||= begin

      # Get data.
      tickets_file = File.read(File.join(root, 'data/tickets.json'))
      tickets_data = JSON.parse(tickets_file)

      # Build database.
      db = {
        :tickets => {}
      }
      tickets_data.each do |ticket|
        db[:tickets][ticket['uuid']] = {
          :name => ticket['name'],
          :price => ticket['price']
        }
      end

      # Return database.
      db

    end
  end

end
