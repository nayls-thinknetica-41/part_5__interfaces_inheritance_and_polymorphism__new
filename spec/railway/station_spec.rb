# frozen_string_literal: true

require 'rspec'

describe Railway::Station do
  let(:train_cargo1) { Railway::Train::TrainCargo.new('cargo1') }
  let(:train_passenger1) { Railway::Train::TrainPassenger.new('passenger1') }

  let(:station_default) { Railway::Station.new('st1') }
  let(:station_full) do
    Railway::Station.new('st1')
                    .arrivale(train_cargo1)
                    .arrivale(train_passenger1)
  end

  context '#initialize' do
    specify 'тип объекта Railway::Station' do
      expect(station_default).to be_an_instance_of(Railway::Station)
    end

    specify 'список поездов @param trains пуст' do
      expect(station_default.trains).to eq([])
    end
  end

  context '@trains' do
    it 'возвращает список поездов на станции' do
      expect(station_full.trains).to eq([train_cargo1, train_passenger1])
    end
  end

  context '#arrivale' do
    it 'грузовой поезд прибывает на станцию' do
      station_default.arrivale(train_cargo1)

      expect(station_default.trains).to eq([train_cargo1])
    end

    it 'пассажирский поезд прибывает на станцию' do
      station_default.arrivale(train_passenger1)

      expect(station_default.trains).to eq([train_passenger1])
    end

    context '@param train не может быть' do
      specify 'String' do
        expect do
          station_default.arrivale('train')
        end.to raise_error(TypeError)
      end

      specify 'Array' do
        expect do
          station_default.arrivale(['train'])
        end.to raise_error(TypeError)
      end

      specify 'Hash' do
        expect do
          station_default.arrivale({ key: 'train' })
        end.to raise_error(TypeError)
      end

      specify 'Integer' do
        expect do
          station_default.arrivale(1)
        end.to raise_error(TypeError)
      end

      specify 'Float' do
        expect do
          station_default.arrivale(1.0)
        end.to raise_error(TypeError)
      end

      specify 'Nil' do
        expect do
          station_default.arrivale(nil)
        end.to raise_error(TypeError)
      end
    end
  end

  context '#departure' do
    it 'грузовой поезд отбывает со станции' do
      station_full.departure(train_cargo1)

      expect(station_full.trains).to eq([train_passenger1])
    end

    it 'пассажирский поезд отбывает со станции' do
      station_full.departure(train_passenger1)

      expect(station_full.trains).to eq([train_cargo1])
    end

    context '@param train не может быть' do
      specify 'String' do
        expect do
          station_default.arrivale('train')
        end.to raise_error(TypeError)
      end

      specify 'Array' do
        expect do
          station_default.arrivale(['train'])
        end.to raise_error(TypeError)
      end

      specify 'Hash' do
        expect do
          station_default.arrivale({ key: 'train' })
        end.to raise_error(TypeError)
      end

      specify 'Integer' do
        expect do
          station_default.arrivale(1)
        end.to raise_error(TypeError)
      end

      specify 'Float' do
        expect do
          station_default.arrivale(1.0)
        end.to raise_error(TypeError)
      end

      specify 'Nil' do
        expect do
          station_default.arrivale(nil)
        end.to raise_error(TypeError)
      end
    end
  end

  context '#trains_on_type' do
    context 'возвращает список поездов на станции по типу' do
      it ':cargo' do
        expect(
          station_full.trains_on_type(Railway::Train::Type::CARGO)
        ).to eq({ Railway::Train::Type::CARGO => [train_cargo1] })
      end

      it ':passenger' do
        expect(
          station_full.trains_on_type(Railway::Train::Type::PASSENGER)
        ).to eq({ Railway::Train::Type::PASSENGER => [train_passenger1] })
      end
    end

    context 'возвращает количество поездов по типу' do
      it ':cargo' do
        expect(
          station_full.trains_on_type(Railway::Train::Type::CARGO).size
        ).to eq(1)
      end

      it ':passenger' do
        expect(
          station_full.trains_on_type(Railway::Train::Type::PASSENGER).size
        ).to eq(1)
      end
    end
  end
end
