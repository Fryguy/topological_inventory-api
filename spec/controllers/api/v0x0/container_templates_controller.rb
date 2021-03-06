RSpec.describe Api::V0x0::ContainerTemplatesController, type: :controller do
  let(:project) { ContainerProject.create!(:source => source, :tenant => tenant, :name => "test_container_project") }
  let(:source) { Source.create!(:tenant => tenant) }
  let(:tenant) { Tenant.create! }
  let!(:template) { ContainerTemplate.create!(:source => source, :tenant => tenant, :container_project => project, :name => "test_container_template") }

  it "get /container_templates lists all Container Templates" do
    get_path(api_v0x0_container_templates_url)

    expect(response.status).to eq(200)
    expect(JSON.parse(response.parsed_body)).to match([a_hash_including("id" => template.id.to_s)])
  end

  it "get /container_templates/:id returns a Container Group" do
    get_path(api_v0x0_container_template_url(template.id))

    expect(response.status).to eq(200)
    expect(JSON.parse(response.parsed_body)).to match(a_hash_including("id" => template.id.to_s))
  end
end
