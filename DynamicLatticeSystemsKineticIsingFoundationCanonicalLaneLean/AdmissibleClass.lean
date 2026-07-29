import DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : KineticIsingAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  KineticIsingWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse