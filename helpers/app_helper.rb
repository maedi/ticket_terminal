module AppHelper

  # Project path.
  @@root = nil

  # Expose app to components.
  def self.set_app(app)
    @@app ||= app
  end

  # Expose session to components.
  def self.set_session(session)
    @@session ||= session
  end

  def self.load_db(root)
    @@db ||= begin

      tickets_file = File.read(File.join(root, 'data/tickets.json'))
      tickets_data = JSON.parse(tickets_file)

      db = {
        :tickets => {}
      }

      tickets_data.each do |ticket|
        db[:tickets][ticket['uuid']] = {
          :name => ticket['name'],
          :price => ticket['price']
        }
      end

      db
    end
  end

end
