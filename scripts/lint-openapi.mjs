import { spawnSync } from "node:child_process";

const result = spawnSync(
  "npx",
  ["--yes", "@redocly/cli", "lint", "openapi.yaml", "--format", "json"],
  {
    encoding: "utf8",
    shell: true,
  }
);

if (result.error) {
  console.error(result.error.message);
  process.exit(1);
}

if (result.stderr) {
  process.stderr.write(result.stderr);
}

let report;
try {
  report = JSON.parse(result.stdout);
} catch {
  process.stdout.write(result.stdout);
  console.error("Could not parse Redocly lint output.");
  process.exit(1);
}

const totals = report.totals ?? {};
const errors = totals.errors ?? 0;
const warnings = totals.warnings ?? 0;
const problems = report.problems ?? [];

if (errors === 0 && warnings === 0 && result.status === 0) {
  console.log("Redocly lint passed with 0 errors and 0 warnings.");
  process.exit(0);
}

console.error(
  `Redocly lint found ${errors} error(s) and ${warnings} warning(s). Treating warnings as failures.`
);

for (const problem of problems) {
  const location = problem.location?.[0];
  const source = location?.source?.ref ?? "openapi.yaml";
  const pointer = location?.pointer ? ` ${location.pointer}` : "";
  const rule = problem.ruleId ? ` ${problem.ruleId}` : "";
  const severity = problem.severity ?? "problem";
  const message = problem.message ?? "Redocly lint problem";

  if (process.env.GITHUB_ACTIONS) {
    const escapedMessage = message.replaceAll("\n", "%0A").replaceAll(":", "%3A");
    console.error(`::error file=${source},title=Redocly ${severity}${rule}::${escapedMessage}${pointer}`);
  } else {
    console.error(`- [${severity}]${rule}${pointer}: ${message}`);
  }
}

process.exit(1);
