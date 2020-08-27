require './roman_numeral.rb'
require 'pry'

describe 'RomanNumeral' do
    describe 'basic validations and setup' do
        it 'creates the model fine' do
            roman_numeral = RomanNumeral.new('I')

            expect(roman_numeral).to be_a(RomanNumeral)
        end

        it 'contains a hash for value lookup' do
            roman_numeral = RomanNumeral.new('I')

            expect(roman_numeral.values[:I]).to eq(1)
            expect(roman_numeral.values[:V]).to eq(5)
            expect(roman_numeral.values[:X]).to eq(10)
            expect(roman_numeral.values[:L]).to eq(50)
            expect(roman_numeral.values[:C]).to eq(100)
            expect(roman_numeral.values[:D]).to eq(500)
            expect(roman_numeral.values[:M]).to eq(1000)
        end

        it 'splits the roman numeral correctly' do
            roman_numeral = RomanNumeral.new('II')

            expect(roman_numeral.roman_num_arr).to eq([1, 1])
        end

        it 'splits a different roman numeral correctly' do
            roman_numeral = RomanNumeral.new('MVCII')

            expect(roman_numeral.roman_num_arr).to eq([1000, 5, 100, 1, 1])
        end
    end

    describe 'beginning calculations with two digits' do
        it 'when we start with something basic' do
            expect(RomanNumeral.calc('IV')).to eq(4)
        end

        it 'when we alternate a simple subtraction' do
            expect(RomanNumeral.calc('VX')).to eq(5)
        end

        it 'when we start with something basic that adds up' do
            expect(RomanNumeral.calc('VI')).to eq(6)
        end

        it 'adds alternate set of two digits that add up' do
            expect(RomanNumeral.calc('MD')).to eq(1500)
        end

        it 'adds additional alternate set of two digits that add up again' do
            expect(RomanNumeral.calc('DL')).to eq(550)
        end

        it 'adds two of the same consecutive numbers fine' do
            expect(RomanNumeral.calc('DD')).to eq(1000)
        end

        it 'adds alternate two of the same consecutive numbers fine' do
            expect(RomanNumeral.calc('CC')).to eq(200)
        end
    end

    # describe 'start testing 3 digit calculations' do
    #     it 'when we start with something basic' do
    #         expect(RomanNumeral.calc('IIV')).to eq(3)
    #     end
    # end
end