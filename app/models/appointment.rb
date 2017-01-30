class Appointment < ApplicationRecord
  self.per_page = 20

  belongs_to :user

  def self.save_cliniko_appointments
    appointments = fetch_from_cliniko
    appointments.each do |appointment|

    end
  end

  def self.fetch_from_cliniko
    data = get_cliniko_appointments
    appointments = data["appointments"]
    if data["total_entries"] > data["appointments"].count
      total_pages = (data['total_entries'].to_f / data["appointments"].count).round
      (2..total_pages).to_a.each do |page_number|
        data = get_cliniko_appointments(page_number)
        appointments << data["appointments"].flatten
      end
    end
    return appointments.flatten
  end

  def self.get_cliniko_appointments(page=1)
    request = RestClient::Request.new({
      method: :get,
      url: "https://api.cliniko.com/v1/appointments?page=#{page}",
      user: '5ea5fc1a6a299864243619263ec26818',
      password: '',
      headers: {"User-Agent" => 'owner-health'}
    })

    response = request.execute
    return JSON.parse(response.to_str)
  end

end
