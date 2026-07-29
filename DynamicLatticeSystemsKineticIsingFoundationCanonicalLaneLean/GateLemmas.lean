import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

def gateClosed (A : KineticIsingAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : KineticIsingAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse