require "rails_helper"

RSpec.describe "routes for Ideas", type: :routing do
  it { expect(get("users/1/ideas/1/")).to route_to("ideas#show", id: "1", user_id: "1")  }

  it { expect(get("users/1/ideas/new/")).to route_to("ideas#new", user_id: "1")  }

  it { expect(get("users/1/ideas/1/edit")).to route_to("ideas#edit", id: "1", user_id: "1")  }

  it { expect(put("users/1/ideas/1/")).to route_to("ideas#update", id: "1", user_id: "1") }

  it { expect(delete("users/1/ideas/2")).to route_to("ideas#destroy", id: "2", user_id: "1") }

  it { expect(post("users/1/ideas/")).to route_to("ideas#create", user_id: "1") }

  it { expect(get("users/1/ideas")).to route_to("ideas#index", user_id: "1") }
end