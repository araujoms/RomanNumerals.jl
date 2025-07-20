module RomanNumberTheory

using RomanNumerals
import RomanNumerals.RN

import Primes

# Who knew Romans did number theory
function Primes.factor(num::RN)
    factors = Dict{RN,RN}()
    for (fac, mul) in Primes.factor(num.val)
        factors[RN(fac)] = RN(mul)
    end
    factors
end
Primes.primes(num::RN) = map(RN, Primes.primes(num.val))

Base.show(io::IO, ::MIME{Symbol("text/plain")}, f::Dict{RN,RN}) =
    join(io, isempty(f) ? "I" : [(e == 1 ? "$p" : "$p^$e") for (p,e) in f], " * ")

end
