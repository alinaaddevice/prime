extension IntAddition on int {
  BigInt get toBigInt => BigInt.from(this);
}

extension BigIntAddition on BigInt {
  BigInt max(BigInt another) {
    if (this > another) {
      return this;
    } else {
      return another;
    }
  }

  BigInt min(BigInt another) {
    if (this < another) {
      return this;
    } else {
      return another;
    }
  }

  BigInt sqrt() {
    if (0.toBigInt == this) {
      return 0.toBigInt;
    }

    BigInt n1 = ((this >> 1) + 1.toBigInt);
    BigInt n2 = (n1 + this ~/ n1) >> 1;
    while (n2 < n1) {
      n1 = n2;
      n2 = (n1 + this ~/ n1) >> 1;
    }

    return n1;
  }
}
