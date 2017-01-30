class Patient < ApplicationRecord
  self.per_page = 20

  belongs_to :user

  def full_name
    "#{patient_first_name} #{patient_last_name}".titleize
  end

  def self.save_cliniko_patients
    patients = fetch_from_cliniko
    patients.each do |patient|

    end
  end

  def self.fetch_from_cliniko
    data = get_cliniko_patients
    patients = data["patients"]
    if data["total_entries"] > data["patients"].count
      total_pages = (data['total_entries'].to_f / data["patients"].count).round
      (2..total_pages).to_a.each do |page_number|
        data = get_cliniko_patients(page_number)
        patients << data["patients"].flatten
      end
    end
    return patients.flatten
  end

  def self.get_cliniko_patients(page=1)
    request = RestClient::Request.new({
      method: :get,
      url: "https://api.cliniko.com/v1/patients?page=#{page}",
      user: '5ea5fc1a6a299864243619263ec26818',
      password: '',
      headers: {"User-Agent" => 'owner-health'}
    })

    response = request.execute
    return JSON.parse(response.to_str)
  end

end
