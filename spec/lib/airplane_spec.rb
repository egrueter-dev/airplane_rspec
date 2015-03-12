require_relative "../../lib/airplane"

describe Airplane do

  describe "#initialization" do
    context 'initializing new plane' do
      it "Has a plane type, wing loading, horsepower." do
        my_plane = Airplane.new("cesna",10,150,100)
        expect([my_plane.type,my_plane.loading,my_plane.horsepower, my_plane.fuel]).to eq(["cesna", 10, 150, 100])
      end
    end
  end

  describe "#land" do
    context "Airplane is not started" do
        it "Returns airplane is not started, please start." do
          my_plane = Airplane.new("cesna",10,150,100)
          expect(my_plane.land).to eq("Airplane not started, please start")
        end
    end

    context "Airplane is already landed" do
      it "Returns airplane is alredy on ground." do
        my_plane = Airplane.new("cesna",10,150,100)
        my_plane.start
        expect(my_plane.land).to eq("Airplane is already on the ground.")
      end
    end

    context "Airplane is airborne" do
      it "Returns airplane landed" do
        my_plane = Airplane.new("cesna",10,150,100)
        my_plane.start
        my_plane.takeoff
        expect(my_plane.land).to eq("Airplane landed.")
        expect(my_plane.flying).to eq(false)
        expect(my_plane.fuel).to eq(70)
      end
    end
  end

  describe "#takeoff" do
    context "Engine is off" do
      it "Returns Airplane is not started" do
        my_plane = Airplane.new("cesna",10,150,100)
        expect(my_plane.takeoff).to eq("Airplane not started, please start")
      end
    end

    context "Engine is on" do
      it "Returns Airplane is Launched" do
        my_plane = Airplane.new("cesna",10,150,100)
        my_plane.start
        expect(my_plane.takeoff).to eq("Airplane Launched")
        expect(my_plane.flying).to eq(true)
        expect(my_plane.fuel).to eq(80)
      end
    end

    context "Airplane is out of fuel" do
      it "Returns airplane is out of fuel" do
        my_plane = Airplane.new("cesna",10,150,0)
        expect(my_plane.takeoff).to eq("Airplane cannot takeoff without fuel")
      end
    end
  end

  describe "#start" do
    context "Start plane when engine off." do
      it "Starts the plane" do
        my_plane = Airplane.new("cesna",10,150,100)
        expect(my_plane.start).to eq("Airplane Started")
        expect(my_plane.fuel).to eq(90)
      end
    end

    context "Start plane when engine on." do
      it "Returns that engine is already on." do
        my_plane = Airplane.new("cesna",10,150,100)
        my_plane.start
        expect(my_plane.start).to eq("Airplane Already Started")
      end
    end

    context "Airplane is out of fuel" do
      it "Returns airplane is out of fuel" do
        my_plane = Airplane.new("cesna",10,150,0)
        expect(my_plane.start).to eq("Airplane cannot start without fuel")
      end
    end
  end
end




# describe Airplane do
#   describe '#flying?' do
#     context 'when the plane is flying' do
#       it 'returns true' do
#
#       end
#     end
#
#     context 'when the plane is not flying' do
#       it 'returns false' do
#
#       end
#     end
#   end
# end
