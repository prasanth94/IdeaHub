require "rails_helper"

RSpec.describe "routes for Ideas", type: :routing do
  it { expect(get("/ideas/1/")).to route_to("ideas#show", id: "1")  }

  it { expect(get("/ideas/new/")).to route_to("ideas#new")  }

  it { expect(get("/ideas/1/edit")).to route_to("ideas#edit", id: "1")  }

  it { expect(put("/ideas/1/")).to route_to("ideas#update", id: "1") }

  it { expect(delete("/ideas/2")).to route_to("ideas#destroy", id: "2") }

  it { expect(post("/ideas/")).to route_to("ideas#create") }

  it { expect(get("/ideas")).to route_to("ideas#index") }
end