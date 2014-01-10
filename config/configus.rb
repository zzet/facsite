Configus.build Rails.env do
  env :production do
    locator do
      cname 'Cname'
    end
    host 'facsite.ru'
    carrierwave do
      storage :file
    end
    mailer do
      from "noreply@facsite.ru"
    end
    basic_auth do
      username 'new_user'
      password 'xdwK3ySD'
    end
  end

  env :development, parent: :production do
    locator do
      cname 'CnameDev'
    end
    host 'facsite.local'
    carrierwave do
      storage :file
    end
  end

  env :test, parent: :production do
    carrierwave do
      storage :file
    end
  end

  env :staging, parent: :production do
    carrierwave do
      storage :file
    end
    basic_auth do
      username 'another_user'
      password 'YHGi0zBw'
    end
  end
end
