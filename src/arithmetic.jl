import Base: ==, isless, <=, <, >,
    +, -, *, ^, max, min, div, %, gcd, lcm,
    isqrt, isodd, iseven, one

# Remember that RN is typealiased to RomanNumeral

# Equality operators
==(n1::RN, n2::RN) = n1.val == n2.val

# Comparisons
<(n1::RN, n2::RN) = n1.val < n2.val
>(n1::RN, n2::RN) = n1.val > n2.val
<=(n1::RN, n2::RN) = n1.val <= n2.val

## Arithmetic
# Multiple argument operators
for op in [:+, :-, :*, :^, :max, :min]
    @eval ($op)(ns::RN...) = $(op)(map(n -> n.val, ns)...) |> RN
end

# Two argument operators
for op in [:div, :%, :gcd, :lcm]
    @eval ($op)(n1::RN, n2::RN) = $(op)(n1.val, n2.val) |> RN
end

# One argument operators
for op in [:isqrt]
    @eval $(op)(num::RN) = $(op)(num.val) |> RN
end

# Integer properties
for op in [:isodd, :iseven, :isprime]
    @eval $(op)(num::RN) = $(op)(num.val)
end
