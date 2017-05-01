require "rails_helper"

RSpec.describe "routes for Users", type: :routing do
  it { expect(get("/users/1/")).to route_to("users#show", id: "1")  }

  it { expect(get("/signup")).to route_to("users#new")  }

  it { expect(post("/signup/")).to route_to("users#create") }

end